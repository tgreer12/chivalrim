# CHIVALRIM
What if Skyrim had combat like Chivalry 2? I don't know! We think it sounds cool though. 

***  

## Project Layout  

***  

### .godot
don't touch

### assets
all reusable sprites, skeletons, animations, sounds, etc.

### lib
all reusable code modules
- can access modules in C# easily with `using chivalrim.lib.folderName`

### prototypes
place to organize ad hoc code, assets, scenes, etc by main scene; meant to test concepts and integrations
- e.g.


```text
project-root/
├── docs/
│   └── architecture.md
├── src/
│   ├── main.py
│   └── utils.py
├── tests/
│   └── test_main.py
└── README.md
