////// HERALDRY //////

//heraldry is the medieval art + science, defining which colors may appear next to each other on a coat of arms ...

//function to return valid colors, gived the neighboring colors
interface HeraldryFn {
  int[] fn(int[] neighbor_ids);
}

class XStitchHeraldry implements HeraldryFn {
  int[]  fn(int[] neighbor_ids) {

    // white is always an option
    int[] tincture_ids = { 
      0
    };

    // color1 and color2 may not touch
    if ( !contains(neighbor_ids, 2)) {
      tincture_ids = append(tincture_ids, 1);
    }

    // and vice versa
    if ( !contains(neighbor_ids, 1)) {
      tincture_ids = append(tincture_ids, 2);
    }

    return tincture_ids;
  }
}