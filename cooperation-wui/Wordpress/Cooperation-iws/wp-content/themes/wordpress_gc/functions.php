<?php
if ( function_exists('register_sidebar') ) {
    register_sidebar( array('before_widget' => '<div class="sidebarboxtop"><img src="' . get_bloginfo('template_url') . '/images/sidebartop.gif" alt="sidebartop" /></div><div class="sidebarbox">', 'after_widget' => '</div><div class="sidebarboxbottom"><img src="' . get_bloginfo('template_url') . '/images/sidebarbottom.gif" alt="sidebarbottom" /></div>', 'before_title' => '<h3>', 'after_title' => '</h3>') );
}
?>