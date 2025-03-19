Python 3.11.0 (v3.11.0:deaf509e8f, Oct 24 2022, 14:43:23) [Clang 13.0.0 (clang-1300.0.29.30)] on darwin
Type "help", "copyright", "credits" or "license()" for more information.
>>> from flask import Flask
... import os
... import datetime
... import subprocess
... 
... app = Flask(__name__)
... 
... def get_top_output():
...     """Fetches system top command output."""
...     try:
...         output = subprocess.check_output(['top', '-b', '-n', '1']).decode('utf-8')
...         return "<pre>" + output + "</pre>"
...     except Exception as e:
...         return f"Error fetching top command output: {str(e)}"
... 
... @app.route('/htop')
... def htop():
...     """Displays system information and top command output."""
...     name = "Jadhav Mayur" 
...     username = os.getenv("USER") or os.getenv("LOGNAME") or "Unknown User"
...     server_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S IST")
... 
...     return f"""
...     <h1>System Info</h1>
...     <p><strong>Name:</strong> {name}</p>
...     <p><strong>Username:</strong> {username}</p>
...     <p><strong>Server Time (IST):</strong> {server_time}</p>
...     <h2>Top Command Output</h2>
...     {get_top_output()}
...     """
... 
... if __name__ == '__main__':
...     app.run(host='0.0.0.0', port=5000)
