    1  cd
    2  ls
    3  apt update -y
    4  sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg
    5  curl -sLS https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
    6  echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
    7  sudo apt update
    8  sudo apt install -y azure-cli
    9  az login
   10  az account set --subscription de54f30d-f375-4d3a-810e-841758031ab5
   11  az aks get-credentials --resource-group 28crdsm --name aks3571 --overwrite-existing
   12  curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.21.0 sh -
   13  cd istio-1.21.0
   14  istioctl install --set profile=ambient -y
   15  ls
   16  curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.21.0 sh -
   17  ls
   18  cd istio-1.21.0/
   19  istioctl install --set profile=ambient -y
   20  cd
   21  cd istio-1.21.0/
   22  istioctl install --set profile=default -y
   23  export PATH=$PWD/bin:$PATH
   24  ls
   25  cd bin/
   26  istioctl install --set profile=default -y
   27  istioctl install --set profile=ambient -y
   28  kubectl label namespace default istio.io/dataplane-mode=ambient
   29  snap install kubectl --classic
   30  kubectl label namespace default istio.io/dataplane-mode=ambient
   31  cd ..
   32  vi d1.yml
   33  kubectl apply -f d1.yml 
   34  vi d2.yml
   35  kubectl apply -f d2.yml 
   36  kubectl get pods
   37  vi crd.yml
   38  kubectl applt -f crd.yml 
   39  kubectl apply -f crd.yml 
   40  vi cr.yml
   41  kubectl apply -f cr.yml 
   42  vi controller.py
   43  vi Dockerfile
   44  cat Dockerfile 
   45  rm Dockerfile 
   46  vi Dockerfile 
   47  vi requirements.txt
   48  apt install docker.io -y
   49  ls
   50  docker build -t dutt1/mt1:1 .
   51  docker login
   52  docker push -t dutt1/mt1:1
   53  docker push dutt1/mt1:1
   54  vi sa.yml
   55  kubectl apply -f sa.yml 
   56  vi crb.yml
   57  kubectl apply -f crb.yml 
   58  vi cc.yml
   59  kubectl apply -f cc.yml 
   60  kubectl get peerauthentication -n default
   61  kubectl get pods -n default -o jsonpath="{.items[*].spec.containers[*].name}"
   62  kubectl get pods -n istio-system -l app=ztunnel
   63  istioctl proxy-config listeners ztunnel-5mjmw -n istio-system
   64  istioctl proxy-config listeners ztunnel-5mjmw
   65  kubectl get pods
   66  kubectl exec -it deployment/nginx -- /bin/bash
   67  kubectl logs -l app=mtls-controller -n default
   68  kubectl get pods
   69  kubectl get peerauthentication -n default
   70  kubectl logs httpd-854b5f7576-v5t4d
   71  kubectl get peerauthentication -n default
   72  kubectl get ns
   73  kubectl get pods -n istio-system
   74  kubectl logs -l app=istio-proxy -n istio-system
   75  kubectl describe peerauthentication peerauth-default -n default
   76  kubectl get pods
   77  kubectl exec -it nginx-68489c4b5d-fxf8b -- curl http://httpd.default.svc.cluster.local
   78  kubectl logs -l app=ztunnel -n istio-system
   79  ls
   80  cp d1.yml d3.yml
   81  vi d3.yml 
   82  kubectl apply -f d3.yml 
   83  kubectl get pods
   84  kubectl exec -it nginx-68489c4b5d-fxf8b -- curl http://mginx2.default.svc.cluster.local
   85  kubectl exec -it nginx-68489c4b5d-fxf8b -- curl http://nginx2.default.svc.cluster.local
   86  kubectl logs -l app=ztunnel -n istio-system
   87  kubectl get pods
   88  kubectl exec -it nginx2-79d8cd6bd-tfxsf -- curl http://httpd.default.svc.cluster.local
   89  kubectl logs -l app=ztunnel -n istio-system
   90  kubectl logs -l app=mtls-controller -n default
   91  ls
   92  cat crb.yml 
   93  vi crb.yml 
   94  kubectl apply -f crb.yml 
   95  kubectl logs -l app=mtls-controller -n default
   96  kubectl rollout restart deployment mtls-controller -n default
   97  kubectl logs -l app=mtls-controller -n default
   98  vi crb.yml 
   99  kubectl apply -f crb.yml 
  100  kubectl rollout restart deployment mtls-controller -n default
  101  kubectl logs -l app=mtls-controller -n default
  102  cat crb.yml 
  103  vi crb.yml 
  104  kubectl delete peerauthentication peerauth-default -n default
  105  kubectl apply -f crb.yml 
  106  kubectl rollout restart deployment mtls-controller -n default
  107  kubectl logs -l app=mtls-controller -n default
  108  kubectl get peerauthentication -n default
  109  kubectl get pod -l app=mtls-controller -n default
  110  kubectl exec -it nginx2-79d8cd6bd-tfxsf -- curl http://httpd.default.svc.cluster.local
  111  kubectl exec -it nginx-68489c4b5d-fxf8b -- curl http://mginx2.default.svc.cluster.local
  112  kubectl exec -it nginx-68489c4b5d-fxf8b -- curl http://ginx2.default.svc.cluster.local
  113  kubectl exec -it nginx-68489c4b5d-fxf8b -- curl http://httpd.default.svc.cluster.local
  114  ls
  115  kubectl delete -f d3.yml 
  116  kubectl create ns test
  117  kubectl apply -f d3.yml test
  118  kubectl apply -f d3.yml -n test
  119  kubectl get pods
  120  kubectl get pods -n test
  121  kubectl exec -it nginx2-79d8cd6bd-g49mj -- curl http://httpd.default.svc.cluster.local
  122  kubectl ns test
  123  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://httpd.default.svc.cluster.local
  124  kubectl logs -l app=mtls-controller -n default
  125  kubectl exec -it nginx-68489c4b5d-fxf8b -- curl http://httpd.default.svc.cluster.local
  126  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://httpd.default.svc.cluster.local
  127  kubectl logs -l app=mtls-controller -n default
  128  kubectl logs -l app=nginx -n default -c istio-proxy
  129  kubectl logs -l app=nginx -n default
  130  kubectl logs -l app=nginx2 -n test
  131  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://httpd.default.svc.cluster.local
  132  kubectl exec -it nginx-68489c4b5d-fxf8b -- curl http://httpd.default.svc.cluster.local
  133  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://nginx.default.svc.cluster.local
  134  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://nginx.default.svc.cluster.local -n default
  135  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://nginx.default.svc.cluster.local
  136  ls
  137  cp d2.yml d4.yml
  138  ls
  139  vi d4.yml 
  140  kubectl apply -f d4.yml 
  141  kubectl delete -f d4.yml 
  142  kubectl apply -f d4.yml -n test
  143  kubectl get pods -n test
  144  kubectl exec -it nginx2 -n test  -- curl http://nginx.default.svc.cluster.local
  145  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://nginx.default.svc.cluster.local
  146  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://httpd.test.svc.cluster.local
  147  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://httpd2.test.svc.cluster.local
  148  history
  149  kubectl get PeerAuthentication
  150  kubectl edit PeerAuthentication peerauth-default
  151  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://httpd2.test.svc.cluster.local
  152  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://httpd.test.svc.cluster.local
  153  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://httpd.default.svc.cluster.local
  154  kubectl get pods
  155* 
  156  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://nginx.default.svc.cluster.local
  157  kubectl edit PeerAuthentication peerauth-default
  158  kubectl exec -it nginx2-79d8cd6bd-g49mj -n test  -- curl http://nginx.default.svc.cluster.local
  159  ls
  160  kubectl logs -l app=mtls-controller -n default
  161  ls
  162  mkdir mtls
  163  cd mtls
  164  ls
  165  pwd
  166  cd
  167  cd istio-1.21.0/
  168  ls
  169  git init
  170  git add .
  171  git branch
  172  git commit -m "mtlsa"
  173  git branch
  174  git branch -M mtls
  175  ls
  176  git remote add origin https://github.com/duttgatiganti/crd.git
  177  ls
  178  git push origin mtls
  179  history | > cmd
  180  ls
  181  git status
  182  git add .
  183  git commit -m "mtlsab"
  184  git status
  185  git push origin mtls
  186  ls
  187  cd
  188  ls
  189  cd istio-1.21.0/
  190  ls
  191  kubectl get pods
  192  ls
  193  cat cmd 
  194  history | >> cmd
  195  cat cmd
  196  history | grep >> cmd
  197  history | > cmd
  198  cat cmd
  199  history > cmd
