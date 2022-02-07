cd proyecto/
    8  git init
    9  ls -la
   10  clear
   11  git checkout -b desarrollo
   12  ls
   13  git status
   14  git add "fichero 1"
   15  git commit -m 'Alta del fichero 1'
   16  clear
   17  git status
   18  git add "fichero 2"
   19  git status
   20  git status
   21  git add "fichero 1"
   22  git status
   23  git status
   24  clear
   25  git diff "fichero 1"
   26  git diff HEAD "fichero 1"
   27  git add *
   28  git status
   29  git commit -m 'Modificaciones, primera parte'
   30  git checkout "fichero 1"
   31  git checkout HEAD^ "fichero 1"
   32  git reset --hard
   33  clear
   34  git log --oneline
   35  git checkout -b cambios1
   36  git add *
   37  git status
   38  git commit -m 'Cambios de Elena'
   39  git checkout desarrollo
   40  git checkout cambios1
   41  git checkout desarrollo
   42  git checkout -b cambios2
   43  git add *
   44  git commit -m 'Cambios de Iñaki'
   45  clear
   46  git log
   47  git log --oneline
   48  git checkout cambios1
   49  git log --oneline
   50  git checkout desarrollo
   51  git log --oneline
   52  git status
   53  git merge cambios2
   54  git add *
   55  git commit -m 'Ultimos cambios en desarrollo'
   56  git merge cambios2 -m 'Fusion de Iñaki'
   57  git checkout cambios2
   58  git checkout cambios1
   59  git checkout desarrollo
   60  git merge cambios1
   61  git checkout cambios1
   62  git staus
   63  git status
   64  git commit -m 'cambios de elena incorporados'
   65  git add *
   66  git commit -m 'cambios de elena incorporados'
   67  git log --oneline
   68  git checkout -b master
   69  git log --oneline
   70  cd ..
   71  mkdir remoto
   72  git init --bare 
   73  cd ..
   74  cd environment/
   75  cd curso
   76  git init
   77  git add *
   78  git commit -m 'Alta del curso'
   79  git remote add origin https://github.com/IvanciniGT/cursoITNowAnsible.git
   80  git config --global credential.helper store
   81  git push origin master
   82  clear
   83  git status
   84  git add *
   85  git commit -m 'comenzamos con ansible'
   86  git push
   87  git push --set-upstream origin master