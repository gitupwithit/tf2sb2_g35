extends CanvasLayer

var loader
var target_scene_path
var progress_bar

func _ready():
	progress_bar = get_node("ProgressBar")
	target_scene_path = "res://scenes/main.tscn"
	loader = ResourceLoader.load_interactive(target_scene_path)
	if loader == null:
		print("Error loading scene: ", target_scene_path)
	else:
		set_process(true)

func _process(delta):
	var err = loader.poll()
	if err == 0:
		var progress = float(loader.get_stage()) / loader.get_stage_count()
		progress_bar.value = progress * 100
	elif err == 3:
		var resource = loader.get_resource()
		get_tree().get_root().call_deferred('add_child', resource.instance())
		set_process(false)  # stop calling _process() once the scene is loaded
		queue_free()
	elif err == 18: # very hacky hack, err should == 3 and not get stuck here.
		var resource = loader.get_resource()
		get_tree().get_root().call_deferred('add_child', resource.instance())
		set_process(false)  # stop calling _process() once the scene is loaded
		queue_free()
	else:
		print("Loading Screen resource load error")
