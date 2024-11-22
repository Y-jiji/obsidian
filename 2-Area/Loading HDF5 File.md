---
tags:
  - 𝔉-note
  - 𝔗-library
  - 𝔗-engineering
  - 𝔑-informal
  - 𝔖-queued
---
# Definition (HDF5 File)

HDF5 file is defined logically like a file system. Groups are like folders and datasets are like files. 

```
/                       (Root group)
├── /Experiment1        (Group)
│   ├── Temperature     (Dataset)
│   ├── Pressure        (Dataset)
│   └── Metadata        (Group)
│        ├── Date       (Dataset)
│        └── Operator   (Dataset)
│
└── /Experiment2        (Group)
    ├── Data1           (Dataset)
    └── Data2           (Dataset)
```

Physically, an HDF5 file contains a file header that points to the root group, it also have check sum to ensure file integrity. 

For each group, it contains a header and data area. The group head contains pointers of children objects. A child object can be another group, or a dataset. 

A dataset can be stored contiguously and compressed contiguously, or it can be chunked. Small datasets can even be stored in object header to save space. 

If a dataset is chunked, then it use some B-tree nodes to point to chunked data. Near the B-tree nodes, there are also a region for heap storage for variable length data. 

# Package (HDFGroup)

There is an C++ package for loading and saving HDF5 files, provided by HDFGroup. 

```
https://github.com/HDFGroup/hdf5
```

However, it is a barbaric implementation, because it scatters undefined memory content everywhere. 

# Package (HighFive)

A better choice is to use the wrapper over HDF5. 

```
https://github.com/BlueBrain/HighFive
```

However, it might be a bit hard for HighFive to find HDF5 library. 

```
Git(
    SITE    "https://github.com"
    USER    "HDFGroup"
    REPO    "hdf5"
    BRANCH  "hdf5_1.14.5"
    PACK    "hdf5"
    PIPELINE "CMAKE INSTALL" PUBLIC
)
Git(
    SITE    "https://github.com"
    USER    "BlueBrain"
    REPO    "HighFive"
    BRANCH  "v3.0.0-beta1"
    PACK    "HighFive"
    TARGET  "HighFive"
    PIPELINE "CMAKE INSTALL" FLAGS "-DHDF5_ROOT=${CMAKE_BINARY_DIR}/3rd_party_install/HDFGroup/hdf5" PUBLIC
)
```

> What are the two ways to force `cmake` look into package installation location?
> ::::::
> Append the installation root to `CMAKE_PREFIX_PATH` ;
> Pass the installation root to `<PACKAGE_NAME>_ROOT`
<!--SR:!2024-11-24,3,250-->

