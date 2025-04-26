using Godot;

namespace MyGodotGame
{
  public partial class Main : Node2D
  {
    private string SvgPath { get; set; } = "res://assets/icon.svg";
    private TextureRect TextureRectNode { get; set; } = null!;

    public override void _Ready()
    {
      // Load the SVG
      var svgTexture = GD.Load<Texture2D>(SvgPath);

      TextureRectNode = new TextureRect
      {
          Texture = svgTexture,
          Position = new(30, 40),
          Scale = new(2, 2),
          FlipV = true,

      };

      AddChild(TextureRectNode);
    }

    public override void _PhysicsProcess(double delta)
    {
        base._PhysicsProcess(delta);
        TextureRectNode.Position += new Vector2(1, 1);
    }

    public override void _Input(InputEvent @event)
    {
      if (@event is InputEventKey { Pressed: true, Keycode: Key.Escape })
      {
        GetTree().Quit();
      }
    }
  }
}
