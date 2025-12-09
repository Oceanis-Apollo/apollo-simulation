```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
# Sauvegarde dans /c/Users/jerom/.ssh/id_ed25519 (crée 2 fichiers)
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
Ajouter la clef publique dans l'interface GitHub.
```bash
ssh -T git@github.com
git clone git@github.com:Oceanis-Apollo/apollo-simulation.git
git config user.name "My Name"
git config user.email myadrees@somewhere
git config core.autocrlf true
```
