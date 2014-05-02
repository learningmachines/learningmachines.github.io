deploy:
	runhaskell site.hs clean
	runhaskell site.hs build
	cd _site && \
	git init . && \
	git add . && \
	git commit -m "Deploy"; \
	git push https://github.com/learningmachines/learningmachines.github.io master --force && \
	rm -rf .git
