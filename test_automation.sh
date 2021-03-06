#if [ -d "myenv" ];
#  then
#    echo "Virtual Environment Exist"
#    source myenv/bin/activate && pip install -r requirements.txt
#  else
#    echo "Creating Virtual Environment"
#    python -m venv myenv
#    source myenv/bin/activate && pip install -r requirements.txt
#fi

echo "updating python env"
pip install --upgrade pip
pip install --upgrade setuptools

echo "Installing dependencies"
pip install -r requirements.txt

echo "Test Started"
# Run test case for 100 user for 10 mins
locust -f locustfile.py -u 10 -r 1 --only-summary --headless --run-time=400 --csv=example_for_100_user