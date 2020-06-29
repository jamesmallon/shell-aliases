
# GENERATING 
gpg --full-generate-key
# RSA and DSA
# Key size = 4096

# --------------------------------------------------------------------------------- 
# ADDING TO GITHUB
# run:
gpg --list-secret-keys --keyid-format LONG # it will print a similar output as bellow
#sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
#uid                          Hubot
#ssb   4096R/42B317FD4BA89E7A 2016-03-10
gpg --armor --export 3AA5C34371567BD2
# Copy your GPG key, beginning with -----BEGIN PGP PUBLIC KEY BLOCK----- and ending with -----END PGP PUBLIC KEY BLOCK----- and add to github

# --------------------------------------------------------------------------------- 
# SETTING COMMITS TO AUTOMATICALLY SIGNIN AND ASSOCIATING YOUR KEY TO THE USER 
git config --global user.signingkey 3AA5C34371567BD2
git config --global commit.gpgsign true
