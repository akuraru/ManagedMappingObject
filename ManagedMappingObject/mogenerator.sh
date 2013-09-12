#!/bin/sh

mogenerator -m ManagedMappingObject.xcdatamodeld -O CoreDataModels \
    --base-class ManagedMappingObject \
    --template-var arc=true