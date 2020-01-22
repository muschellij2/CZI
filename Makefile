all: index.pdf index.html README.md diversity.html

index.pdf: index.Rmd
	Rscript -e "rmarkdown::render('index.Rmd')"

index.html: index.Rmd
	Rscript -e "rmarkdown::render('index.Rmd', output_format = 'html_document')"

diversity.html: diversity.md
	Rscript -e "rmarkdown::render('diversity.md', output_format = 'html_document')"		

README.md: README.Rmd
	Rscript -e "rmarkdown::render('README.Rmd', output_format = 'html_document')"

clean:
	rm -f index.pdf README.md index.html
