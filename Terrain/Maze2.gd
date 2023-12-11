extends Node3D

const N = 1
const E = 2
const S = 4
const W = 8

var cell_walls = {
	Vector2(0,-1): N,
	Vector2(1, 0): E,
	Vector2(0, 1): S,
	Vector2(-1, 0): W
}

var map = []

var tiles = [
	preload("res://Terrain/Tile_0.tscn")
	,preload("res://Terrain/Tile_1.tscn")
	,preload("res://Terrain/Tile_2.tscn")
	,preload("res://Terrain/Tile_3.tscn")
	,preload("res://Terrain/Tile_4.tscn")
	,preload("res://Terrain/Tile_5.tscn")
	,preload("res://Terrain/Tile_6.tscn")
	,preload("res://Terrain/Tile_7.tscn")
	,preload("res://Terrain/Tile_8.tscn")
	,preload("res://Terrain/Tile_9.tscn")
	,preload("res://Terrain/Tile_10.tscn")
	,preload("res://Terrain/Tile_11.tscn")
	,preload("res://Terrain/Tile_12.tscn")
	,preload("res://Terrain/Tile_13.tscn")
	,preload("res://Terrain/Tile_14.tscn")
	,preload("res://Terrain/Tile_15.tscn")	
]

var tile_size = 4
var dim_x = 6
var dim_z = 6

func _ready():
	randomize()
	make_maze()

func make_maze():
	var unvisited = []
	var stack = []
	for x in range(dim_x):
		map.append([])
		map[x].resize(dim_z)
		for z in range(dim_z):
			unvisited.append(Vector2(x,z))
			map[x][z] = N|E|S|W
	var current = Vector2(0,0)
	unvisited.erase(current)
	while unvisited:
		var neighbors = check_neighbors(current, unvisited)
		if neighbors.size() > 0:
			var next = neighbors[randi() % neighbors.size()]
			stack.append(current)
			var dir = next - current
			var current_walls = map[current.x][current.y] - cell_walls[dir]
			var next_walls = map[next.x][next.y] - cell_walls[-dir]
			map[current.x][current.y] = current_walls
			map[next.x][next.y] = next_walls
			current = next
			unvisited.erase(current)
		elif stack:
			current = stack.pop_back()
	map[0][0] &= E|S|W
	for x in range(dim_x):
		for z in range(dim_z):
			var tile = tiles[map[x][z]].instantiate()
			tile.position = Vector3(x*tile_size, 0, z*tile_size)
			tile.name = "Tile_" + str(x) + "_" + str(z)
			add_child(tile)
			


func check_neighbors(current, unvisited):
	var list = []
	for n in cell_walls.keys():
		if current + n in unvisited:
			list.append(current + n)
	return list
