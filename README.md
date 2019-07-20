# Mesh

## Vertices and edges appear and move at random until they die

### Example
![Mesh](mesh.gif?raw=true "Mesh")

### What is happening
The code has two stages:
* Stage 1 - Growing: vertices are added at a constant high probability rate to the world
* Stage 2 - Dying: vertices are added at a diminishing probability rate to the world

### Vertice behavior
Each vertice moves at a random speed which diminishes over time.
When the edge of the world is reached, the vertices bounce off of it.
The initial color of all vertices is the same (purple) and gradually turns redder and more transparent untill death.
During both stages of the world each vertice has a predefined lifespan. When reached, the vertice will die and be removed from the world.

### Edge behavior
Each vertice is connected to its neighboring vertices with edges.
The weight and transparency of each edge is proportional to the distance between the vertices it connects.
When the defined distance threshold is reached, the edge is removed from the world.

### Configurations
All configurations are located at the top of the Mesh.pde file:
* maxDistanceForEdge: the maximum distance which will trigger the creation of an edge between vertices
* startDotNum: the initial number of vertices in the world
* maxDotNum: the maximum number of vertices in the world
* maxVel: the maximum speed in which a vertice can move 
* minVel: the minimum speed in which a vertice can move
* maxAge: the maximum lifespan of a vertice
* stage: which stage the world is in
* frame: a frame counter for image saving
* saveImage: a boolean toggle for image saving
* spawnChance: the initial chance of randomly spawning a new vertice
