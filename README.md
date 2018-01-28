To reproduce the error:

1. Clone repo and switch to 'apollo-error' branch
2. Run 'docker build -t ssr .' to create the image
3. Run 'docker run -p 4000:80 ssr'
4. Open http://localhost:4000 in the browser
5. Observe errors in whichever console utility you launched the container from

Switch to 'master' branch and repeat above steps for verification that the library is the source of the error. 
