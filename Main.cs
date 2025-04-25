using Godot;
using System;

namespace MyGodotGame
{
	public partial class Main : Node2D
	{
		public override void _Ready()
		{
			GD.Print("Main scene loaded!");
			GetTree().Quit();
		}

		// public override void _Input(InputEvent @event)
		// {
		//     if (@event is InputEventKey key && key.Pressed && key.Keycode == Key.Escape)
		//         GetTree().Quit();
		// }
	}
}
