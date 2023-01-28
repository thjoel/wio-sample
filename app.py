# [START wio-sample-app]
from flask import Flask
app = Flask('wio-sample')

@app.route('/')
def launch():
 
  from google.cloud import compute_v1

  credentials = None
  service = compute_v1.InstancesClient(credentials=credentials)

  project = 'wio-sample'
  zone = 'us-central1-a'
  instance = 'mongo1'
  vm_state = service.get(project=project, zone=zone, instance=instance).status

  if vm_state == "TERMINATED":
    service.start(project=project, zone=zone, instance=instance)
    print("\n\n\n\t\tStarting VM to save your visit token!\n\n")
  
  else:
    print("VM running, needs to be stopped!")
  
  return "Done."

if __name__ == '__main__':
  app.run(host = '0.0.0.0', port = 8080)
# [END wio-sample-app]
