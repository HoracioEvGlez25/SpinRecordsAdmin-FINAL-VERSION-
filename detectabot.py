from flask import Flask, request, send_file, render_template_string
import io
import zipfile
import time

app = Flask(__name__)

login_page = '''
<!DOCTYPE html>
<html>
<head><title>Login</title></head>
<body>
  <h2>Login</h2>
  <form method="POST" action="/login" onsubmit="document.getElementById('time').value = Date.now() - window.startTime;">
    <label>Username:</label><input type="text" name="username" required><br>
    <label>Password:</label><input type="password" name="password" required><br>
    <input type="text" name="trap" style="display:none">
    <input type="hidden" name="time" id="time">
    <button type="submit">Login</button>
  </form>
  <script>window.startTime = Date.now();</script>
</body>
</html>
'''

@app.route("/")
def index():
    return render_template_string(login_page)

@app.route("/login", methods=["POST"])
def login():
    honeypot = request.form.get("trap")
    time_taken = int(request.form.get("time", "0"))

    if honeypot or time_taken < 2000:
        # Simular envío de "zip bomb" (segura)
        memory_file = io.BytesIO()
        with zipfile.ZipFile(memory_file, 'w', zipfile.ZIP_DEFLATED) as zipf:
            for i in range(1000):
                zipf.writestr(f"file_{i}.txt", "Esto es un archivo vacío\n" * 1000)
        memory_file.seek(0)
        return send_file(memory_file, mimetype='application/zip',
                         as_attachment=True, download_name='fake_zip_bomb.zip')
    
    username = request.form.get("username")
    return f"Bienvenido, {username} (no eres un bot)"

if __name__ == "__main__":
    app.run(debug=True)

