git add .
git commit -m 'add'
git push -u origin-qifeiblog main
hexo clean && hexo generate && hexo deploy
