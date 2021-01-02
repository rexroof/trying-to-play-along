
curl -o aws-iam-authenticator \
  https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/aws-iam-authenticator
chmod 0755 aws-iam-authenticator


if [ -d "$HOME/bin" ] ; then
  mv aws-iam-authenticator $HOME/bin/
else
  echo "downloaded aws-iam-authenticator, $HOME/bin/ not found, please install into path"
fi 

