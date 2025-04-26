    1  cd
    2  apt update -y
    3  sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg
    4  curl -sLS https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
    5  echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
    6  sudo apt update
    7  sudo apt install -y azure-cli
    8  az login
    9  az account set --subscription de54f30d-f375-4d3a-810e-841758031ab5
   10  az aks get-credentials --resource-group crd2604 --name aks3571 --overwrite-existing
   11  vi crd.yml
   12  snap install kubectl --classic
   13  kubectl apply -f crd.yml 
   14  vi crb.yml
   15  kubectl apply -f crb.yml 
   16  vi operator.py
   17  vi Dockerfile
   18  vi requirements.txt
   19  apt intsall docker.io -t
   20  apt intsall docker.io -y
   21  apt install docker.io -y
   22  docker build -t dutt1/crd263:1 .
   23  docker push dutt1/crd263:1
   24  vi o.yml
   25  kubectl apply -f o.yml 
   26  vi cr.yml
   27  kubectl apply -f cr.yml 
   28  kubectl get svc my-service -o yaml
   29  kubectl get svc
   30  kubectl get pods -l app=mesh-operator
   31  kubectl logs deployment/mesh-operator
   32  kubectl get meshpolicies
   33  cat cr.yml 
   34  vi d.yml
   35  kubectl apply -f d.yml 
   36  kubectl get meshpolicies
   37  kubectl logs deployment/mesh-operator
   38  kubectl get svc
   39  kubectl get svc my-service -o yaml
   40  kubectl logs deployment/mesh-operator
   41  cat crb.yml 
   42  vi crb.yml 
   43  kubectl apply -f crb.yml 
   44  kubectl logs deployment/mesh-operator
   45  cat crb.yml 
   46  kubectl rollout restart deployment mesh-operator
   47  kubectl logs deployment/mesh-operator
   48  kubectl get crd
   49  cat crd.yml 
   50  vi crd2.yml
   51  kubectl apply -f crd2.yml 
   52  rm crd2.yml
   53  vi crd2.yml
   54  kubectl apply -f crd2.yml 
   55  vi cr2.yml
   56  kubectl apply -f cr2.yml 
   57  cat cr2.yml 
   58  rm crd2.yml
   59  vi crd2.yml
   60  kubectl apply -f crd2.yml 
   61  kubectl apply -f cr2.yml 
   62  ls
   63  cat operator.py 
   64  rm operator.py 
   65  vi operator.py 
   66  history | grep docker
   67  docker build -t dutt1/crd263:1 .
   68  docker push dutt1/crd263:1
   69  kubectl rollout restart deployment mesh-operator
   70  kubectl logs deployment/mesh-operator -f
   71  kubectl get crd
   72  cat crd.yml 
   73  cat crd2.yml 
   74  kubectl delete crd autoscalers.example.com
   75  kubectl apply -f crd.yaml
   76  kubectl apply -f crd2.yaml
   77  ls
   78  kubectl apply -f crd2.yml
   79  kubectl logs deployment/mesh-operator -f
   80  cat crd2.yml 
   81  rm crd2.yml 
   82  vi crd2.yml 
   83  kubectl apply crd2.yml 
   84  kubectl apply -f crd2.yml 
   85  kubectl apply -f cr2.yml 
   86  kubectl logs deployment/mesh-operator -f
   87  kubectl get crd
   88  cat crb.yml 
   89  vi crb.yml 
   90  kubectl apply -f crb.yml 
   91  kubectl rollout restart deployment mesh-operator
   92  kubectl logs deployment/mesh-operator -f
   93  cat crb.yml 
   94  cat crd2.yml 
   95  vi crb.yml 
   96  kubectl apply -f crb.yml 
   97  kubectl rollout restart deployment mesh-operator
   98  kubectl logs deployment/mesh-operator -f
   99  cat operator.py 
  100  rm operator.py 
  101  vi operator.py 
  102  history | grep docker
  103  docker build -t dutt1/crd263:1 .
  104  docker push dutt1/crd263:1
  105  kubectl get pods
  106  docker login
  107  docker push dutt1/crd263:1
  108  kubectl rollout restart deployment mesh-operator
  109  kubectl logs deployment/mesh-operator -f
  110  kubectl delete -f .
  111  rm -rf *
  112  ls
  113  vi crd.yml
  114  kubectl apply -f crd.yml 
  115  vi cr.yml
  116  kubectl apply -f cr.yml 
  117  vi controller.py
  118  vi Dockerfile
  119  docker build -t crd263:2 .
  120  docker push crd263:2
  121  docker login
  122  docker push crd263:2
  123  docker build -t dutt/crd263:2 .
  124  docker push dutt/crd263:2
  125  docker build -t dutt1/crd263:2 .
  126  docker push dutt1/crd263:2
  127  vi crb.yml
  128  rm crb.yml
  129  vi crb.yml
  130  rm crb.yml
  131  vi crb.yml
  132  kubectl apply -f crb.yml 
  133  vi cd.yml
  134  kubectl apply -f cd.yml 
  135  vi fd.yml
  136  kubectl apply -f fd.yml 
  137  kubectl logs deployment/traffic-policy-controller
  138  ls
  139  rm crb.yml 
  140  vi crb.yml 
  141  kubectl apply crb.yml 
  142  kubectl apply -f crb.yml 
  143  kubectl rollout restart deployment traffic-policy-controller
  144  kubectl logs deployment/traffic-policy-controller
  145  ls
  146  cat controller.py 
  147  vi controller.py 
  148  docker build -t dutt1/crd263:2 .
  149  docker push dutt1/crd263:2
  150  kubectl rollout restart deployment traffic-policy-controller
  151  kubectl logs deployment/traffic-policy-controller
  152  cat crb.yml 
  153  vi crb.yml 
  154  kubectl apply -f crb.yml 
  155  kubectl rollout restart deployment traffic-policy-controller
  156  kubectl logs deployment/traffic-policy-controller
  157  kubectl get service frontend -n default -o yaml
  158  kubectl get trafficpolicy allow-frontend -n default -o yaml
  159  kubectl get pods -n default -l app=frontend
  160  kubectl get deployment frontend -n default -o yaml
  161  kubectl get pods -n default -l app=frontend
  162  kubectl logs frontend-5748c94d4b-pr8w5 -c istio-proxy -n default
  163  kubectl get virtualservices
  164  istioctl dashboard kiali
  165  kubectl get deployment frontend -n default -o yaml | grep "sidecar.istio.io/inject"
  166  kubectl get pods -n istio-system
  167  kubectl get pods
  168  kubectl logs frontend-5748c94d4b-pr8w5
  169  kubectl get pod frontend-5748c94d4b-pr8w5 -n default -o jsonpath='{.spec.containers[*].name}'
  170  kubectl get service frontend -n default -o yaml
  171  kubectl get pods
  172  kubectl describe pod frontend-5748c94d4b-pr8w5 -n default
  173  cat cr.yml 
  174  ls
  175  history | > cmd
  176  ls
  177  cat cmd
  178  history >> cmd
