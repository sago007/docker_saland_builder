Used for nightly builds of saland


Build
```
docker build . -t saland_builder
```

Run
```
docker run -i --rm -v $PATH_TO_DESTINATION:/data saland_builder
```

Quick test:
```
mkdir -p build && docker run -it --rm -v "$(pwd)"/build:/data saland_builder
```

