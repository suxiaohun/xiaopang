// Import TinyMCE
import 'tinymce/tinymce';

// A theme is also required
import 'tinymce/themes/silver';
import 'tinymce/skins/ui/oxide/skin.css';
import contentStyle from 'tinymce/skins/ui/oxide/content.css';
import contentStyle2 from 'tinymce/skins/content/default/content.css';


// Plugins
import 'tinymce/plugins/paste/plugin'
import 'tinymce/plugins/link/plugin'
import 'tinymce/plugins/autoresize/plugin'

// Initialize
tinymce.init({
    selector: '#fate_content',
    skin: false,
    theme: 'silver',
    min_height: 600,
    statusbar: false,
    content_style: contentStyle.toString() + '\n' + contentStyle2.toString(),
    // content_style: contentStyle2.toString(),
    plugins: ['paste', 'link', 'autoresize']
});