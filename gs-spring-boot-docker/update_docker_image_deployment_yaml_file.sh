awk -i inplace  -v var1="capstone-project3:pgdevops-BUILD_NUMBER" -v var2=capstone-project3:pgdevops-$1 '{gsub(var1,var2); print;}' gs-spring-boot-docker/deploy_k8s.yaml
