package oni_docs

import o "../../oni"
import g "../globlas"


routes_init :: proc() {
	tex, ok := o.Load_Texture("assets/oni-2.avif")
	if ok do g.app.image_texture = tex
}
