build:
	docker build -t jupyterdocker .

run:
	docker run -it --rm -p 8888:8888 -v $(PWD)/work:/home/jovyan/work -v $(PWD)/jupyter-config:/home/.jupyter jupyterdocker

entry:
	docker run -it --rm -p 8888:8888 -v $(PWD)/work:/home/jovyan/work -v $(PWD)/jupyter-config:/home/.jupyter --entry-point /bin/sh jupyterdocker