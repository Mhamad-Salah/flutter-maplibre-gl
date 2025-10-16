part of maplibre_gl;

extension MapBoxColorConversion on Color {
  String toHexStringRGB() {
    final r = (this.r * 255.0).round() & 0xff;
    final g = (this.g * 255.0).round() & 0xff;
    final b = (this.b * 255.0).round() & 0xff;

    return '#$r$g$b';
  }
}
