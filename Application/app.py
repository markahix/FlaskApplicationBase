### Base Requirements for a Flask application.
from utilities.file_management import *
from utilities.server_functions import *
from utilities.application_functions import *

### Basic startup, sets a secret key and some standard folders
app = Flask(__name__)
app.config['SECRET_KEY'] = "01189998819991197253"
app.config['UPLOAD_FOLDER'] = "/uploads/"
app.config['DATABASE_FOLDER'] = "/database/"
app.config['TEMPLATES_AUTO_RELOAD'] = True


### Starting Page
@app.route('/',methods=['GET', 'POST'])
def start_page():
    return render_template("main.html")