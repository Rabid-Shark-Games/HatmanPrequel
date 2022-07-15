use gdnative::prelude::*;

#[derive(NativeClass)]
#[inherit(Node2D)]
pub struct HelloWorld;

#[methods]
impl HelloWorld {
    fn new(_owner: &Node2D) -> Self {
        HelloWorld
    }

    #[export]
    fn _ready(&self, _owner: &Node2D) {
        godot_print!("hello, world.");
    }
}

fn init(handle: InitHandle) {
    handle.add_class::<HelloWorld>();
}

godot_init!(init);