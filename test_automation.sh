if [ -d "myenv" ];
  then
    echo "Virtual Environment Exist"
    source myenv/bin/activate && pip install -r requirements.txt
  else
    echo "Creating Virtual Environment"
    python3 -m venv myenv
    source myenv/bin/activate && pip install -r requirements.txt
fi

echo "Test Started"
# Run test case for 100 user for 10 mins
locust -f locustfile.py -u 100 -r 1 --only-summary --headless --run-time=6000 --csv=example_for_100_user