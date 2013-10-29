#!/bin/sh

mogenerator -m ManagedMappingObject/ManagedMappingObject.xcdatamodeld -O ManagedMappingObject/CoreDataModels \
    --base-class ManagedMappingObject \
    --template-var arc=true