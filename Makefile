VERSION_PONG=0.24.0.1

default:
	task

templ:
	go install github.com/a-h/templ/cmd/templ@latest

print:
	echo $(VERSION_PONG)

build:
	docker build -t pong106/immich-kiosk:$(VERSION_PONG) -t pong106/immich-kiosk:latest .

push-image:
	docker build --build-arg VERSION=$(VERSION_PONG) --platform linux/amd64,linux/arm64 --push -t pong106/immich-kiosk:$(VERSION_PONG) -t pong106/immich-kiosk:latest .

registry-tag-push:
	docker tag pong106/immich-kiosk:$(VERSION_PONG) 192.168.51.122:5088/pong106/immich-kiosk:$(VERSION_PONG)
	docker tag pong106/immich-kiosk:latest 192.168.51.122:5088/pong106/immich-kiosk:latest
	docker push 192.168.51.122:5088/pong106/immich-kiosk:$(VERSION_PONG)
	docker push 192.168.51.122:5088/pong106/immich-kiosk:latest

gitea-push:
	git push pong106 kp_main:main
	git push gitea kp_main:main

versioning:
	goland Makefile
	goland taskfile.yml