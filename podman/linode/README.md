# contents of .env 

Example token and root pwd
```
  export TF_VAR_linode_token=493a846113e0c925fa8bca0ca45fddad2214b8c0bbc5e4d8152b55
  export TF_VAR_root_pwd=eiGaeThiechoocoo1tie
```

# run like this

```
    source .env
    terraform apply -var "ssh_key=$(cat ~/.ssh/id_rsa.pub)"
```

