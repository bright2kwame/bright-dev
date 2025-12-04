import http.server
import socketserver
import os

PORT = int(os.environ.get('PORT', 5000))

class FlutterRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory='build/web', **kwargs)
    
    def do_GET(self):
        # If the request is for a file that exists, serve it
        if os.path.exists('build/web' + self.path) and not self.path == '/':
            super().do_GET()
        else:
            # Otherwise, serve index.html for client-side routing
            self.path = '/index.html'
            super().do_GET()

with socketserver.TCPServer(("", PORT), FlutterRequestHandler) as httpd:
    httpd.serve_forever()