using Godot;

namespace MyGodotGame
{
	public partial class Main : Node2D
	{
		[Export]
		private ColorRect Rect { get; set; } = null!;

		private Vector2 _velocity = new(100, 100); // pixels per second

		public override void _Ready()
		{
			GD.Print("Main scene loaded!");
			
			Rect = new()
			{
				Color = new(0.9f, 0.6f, 0.8f),
				Size = new(200, 100),
				Position = new(100, 100),
			};
			AddChild(Rect);
		}

		public override void _PhysicsProcess(double delta)
		{
			base._PhysicsProcess(delta);
			Rect.Position += _velocity * (float)delta;
		}

        public override void _Input(InputEvent @event)
		{
		    if (@event is InputEventKey key && key.Pressed && key.Keycode == Key.Escape)
		        GetTree().Quit();
		}
	}
}
