GDPC                 �	                                                                         T   res://.godot/exported/133200997/export-05d8d9c8af05f861af50c6d4c1f4eea7-bullet.scn  �      �      QDv#=?p�f�D;f�/    P   res://.godot/exported/133200997/export-2ddd04d543d5858e7f20c9299a8b5096-main.scnp      �      ��
@i���W.��$�    P   res://.godot/exported/133200997/export-53a0af8f00fbc899d4d541c34a803049-menu.scn       y      d����t���D�^�q    P   res://.godot/exported/133200997/export-982e7c4e07d08eb16dee27c6fe9e45d5-mob.scn �      �      �X�6S6hƅ����ו    \   res://.godot/exported/133200997/export-d480ec2241b801fab7ff87b6104cc1b0-main_character.scn  P      V      �I��\+p��0k䔄        res://.godot/extension_list.cfg �H      5       q�Y��C�)�$    ,   res://.godot/global_script_class_cache.cfg  �B            ^W�@��E}%=��E�R    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�/      &      A]/�no.^La_L�;       res://.godot/uid_cache.bin  �G      �       L�uP�hmu�/A�B��        res://Prefabs/bullet.tscn.remap p?      c       RH:�)�<�ʹp���    (   res://Prefabs/main_character.tscn.remap �?      k       V�R���u妯Ia^       res://Prefabs/mob.tscn.remapP@      `       ��9%���i��Z҂�       res://Scenes/main.tscn.remap�@      a       F�����X�����       res://Scenes/menu.tscn.remap A      a       �H��HS�:&�1�"        res://Scripts/bullet.gd.remap   �A      )       �鼪��=({��=�u�       res://Scripts/bullet.gdc�      �      ~�=�O������|7        res://Scripts/character.gd.remap�A      ,       �s)�\+��Q�@��"aJ       res://Scripts/character.gdc P       �      ���4|ȅ V����    $   res://Scripts/game_manager.gd.remap �A      /       qx�\m��YQ�砪�        res://Scripts/game_manager.gdc   $      �      �~M�/Vc��d����       res://Scripts/mob.gd.remap   B      &       ~� �d�I8O_7�����       res://Scripts/mob.gdc   �&      �      ��5ʜ[A��_,��G��    $   res://Scripts/mob_spawner.gd.remap  PB      .       ғ���s+�EG�?�[        res://Scripts/mob_spawner.gdc   @)      I      h��l��I Sȁx�V    4   res://addons/godot-git-plugin/git_plugin.gdextension        �      k��$f�0o�`r�b       res://icon.svg  �C      �      �W|��/�\�pF[       res://icon.svg.import   �<      �       �t���T�6��N��       res://menu.gd.remap �B             20v��J�,���B��       res://menu.gdc  �=      �      z��|��V�r��\X�       res://project.binary�H      �      ˙�7�@Ύ�I�>�=�    [configuration]

entry_symbol = "git_plugin_init"
compatibility_minimum = "4.1.0"

[libraries]

macos.editor = "macos/libgit_plugin.macos.editor.universal.dylib"
windows.editor.x86_64 = "win64/libgit_plugin.windows.editor.x86_64.dll"
linux.editor.x86_64 = "linux/libgit_plugin.linux.editor.x86_64.so"
linux.editor.arm64 = "linux/libgit_plugin.linux.editor.arm64.so"
linux.editor.rv64 = ""
           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://Scripts/bullet.gd ��������
   Texture2D    res://icon.svg ?�=�HN�J      local://RectangleShape2D_h8f8c �         local://PackedScene_evb0o �         RectangleShape2D       
     �A  HB         PackedScene          	         names "         Bullet    scale    script    Area2D 	   Sprite2D 	   rotation    texture 
   Sprite2D2 	   position    CollisionShape2D    shape    _on_body_entered    body_entered    	   variants       
   �HE>5�h>             ��?
   " (> �>         
     ����3
   er=i�>                node_count             nodes     2   ��������       ����                                  ����                                       ����                                       	   	   ����         
                conn_count             conns                                       node_paths              editable_instances              version             RSRC        RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://Scripts/character.gd ��������   PackedScene    res://Prefabs/bullet.tscn ���~���k
   Texture2D    res://icon.svg ?�=�HN�J      local://RectangleShape2D_ds6lo �         local://PackedScene_q5jtg �         RectangleShape2D       
     �B  �B         PackedScene          	         names "         MainCharacter    script    Bullet    CharacterBody2D    Sprite    texture 	   Sprite2D    Sprite2 	   position    scale    CollisionShape    z_index    shape    CollisionShape2D    Muzzle 	   Marker2D    WeaponCooldown    Timer    	   variants    	                               
      B  ��
   ��E>�c�>      
         ��          
     �B          node_count             nodes     >   ��������       ����                                  ����                           ����         	                           
   ����                                       ����                           ����              conn_count              conns               node_paths              editable_instances              version             RSRC          RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://Scripts/mob.gd ��������
   Texture2D    res://icon.svg ?�=�HN�J      local://RectangleShape2D_niegb �         local://PackedScene_nf30h �         RectangleShape2D       
     �B  �B         PackedScene          	         names "      	   BasicMob    script    CharacterBody2D 	   Sprite2D    texture 
   Sprite2D2 	   position 	   rotation    scale 
   Sprite2D3    mobs    CollisionShape2D    shape    	   variants                          
     �B  ��   ��;
   �V�>Y�?
     ��  ��
          �                node_count             nodes     <   ��������       ����                            ����                           ����                                          	   ����                              
                 ����                         conn_count              conns               node_paths              editable_instances              version             RSRC   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       PackedScene "   res://Prefabs/main_character.tscn 30�F1w�    Script    res://Scripts/mob_spawner.gd ��������   PackedScene    res://Prefabs/mob.tscn ���UP"_T   Script    res://Scripts/game_manager.gd ��������      local://LabelSettings_w8q0s �         local://LabelSettings_qix6j �         local://PackedScene_i0ulx �         LabelSettings          (            LabelSettings          <            PackedScene          	         names "         Game    Node    MainCharacter 	   position    MobSpawner    script    Mob    Node2D    LeftMarker 	   Marker2D    RightMarker    CanvasLayer    WaveCleared    visible    offset_left    offset_top    offset_right    offset_bottom    text    label_settings    Label    WaveNumber    GameManager    	   variants                 
    �D  �C                  
     �  �C
    ��D ��C            �C     	C    �7D     @C      WAVE CLEARED               ��C     8B    �+D     C      WAVE 1                         node_count    	         nodes     e   ��������       ����                ���                                  ����                          	      ����                    	   
   ����                           ����                     ����                        	      
                                ����                                                         ����                   conn_count              conns               node_paths              editable_instances              version             RSRC         RSRC                    PackedScene            ��������                                                  .    resource_local_to_scene    resource_name 	   _bundled    script       Script    res://menu.gd ��������      local://PackedScene_35do1          PackedScene          	         names "         Control    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script 
   Container    anchor_left    anchor_top    offset_left    offset_top    offset_right    offset_bottom    scale    VBoxContainer    Start    focus_neighbor_top $   theme_override_font_sizes/font_size    text    Button    Exit    	   variants                        �?                                  ?     ~�     ��     ~B     �B
     �?  �?             (         START       Exit       node_count             nodes     R   ��������        ����                                                                ����               	      
                           	      
                                            ����                                            ����                               conn_count              conns               node_paths              editable_instances              version             RSRC       GDSCd   x  (�/�`xe �TD>@�(��Wf7�Q��e��WmۃۘO�C$�I��s�1�_'����0~&5���?k��Bv
* 3 3 )mSmUm�%�k݀�(��&?l����-���-�����_����������fkNY���c��J�V��N2��mEHP,mDhk�-�m�A[m�M�k Y�|�+��9^,�>��{�~��W�?ń��?4��e����*�Gr�:}@��I����H�3�L4Һ��!3oC�6�c��ff"f�Z�.��U�4��N0����
R�Re��D9��y�Ҵ$%�Gc��٭�2�� ��q8�W�@%C�ޭd����?y���$�d</��)��ùc�t�I���mS��z�&���,�X�]vt�������*�}#(���31)����m�Z��֞M2*N��J���wl��������||�A�2�A�G����[�<C�\MM�7���WN���lx�'��O(nW�m�#�����o>{�zؙ�М�r�O��?�9<�[�ޠ�o[~{�H7�';���=�To��G��_��1SO��v��o�0N������t��1ڧ��Z�C���/ѣO��_�o���}�>�m�@��ۄGV�|�qm�~��u��0h�Gv�'lη�o�*              GDSCd   H  (�/�`H
� v\D�(�@�	�\h�Ўt�i���oT5@G�O`1�Q�A�/+)*(��HS@����G�?���.�m�;? M ? ��T�!���{�R�P�c�h��oV�n.��튶ڒh�j�Җ�l�jۉh�j�Ҷů�w�K~���{~ѿ��	~��� �?���G�X,�DB��Dd�HɃ�
����?���F�H��`*����\@1�Œ�#�����4�5
�hN2򉑯��!���|���{��Æ?�����������S�O?�o�E���'�?��N�i܀�2��@H܊�5�����D'�F+A��m"��B#rnm��!�0UH~�F4;.�x<��:�ɚ��m@������l�	����ݒ��V���!����'<]�����$��`d���<�����g���Z������w�猘ې�6�3˿��yX5���Jf�y��(��P��;\���M�o�1�+������x���N�Ī�a�pJ��)��_��������vm�ץ������H�3�z��7K���t�V�����aR`�fO�3��C�;�L��|D�5����k��qs/��jV<�[�����<���ax6WF�C���������p���Y��p�G�0z�=1��ʸ8L<ι����.l�������UE���k�V1ŇO��Av�F~t+w�$��SQ���%�k���#�'�?����}�E���Q1�y?��p�'�Y�p����y�q�@u`���"x<�~�ޣ��r����o��tD�C��.~m}�z�둻��l��-�֢�^3�c~�߳l�{�ܴE��OIf�6�L��u���aϞ��Z�^�}������zJ��j焷��vn,����M��:/�g����s��a\,�S���veE   GDSCd   �  (�/�`�- v�M@0O�ᇒNh��\C< ���۴��hQ��0�Vږ�����RW� �PN7�����g퓶���3 B 9 m�#E�Y�?�h�j;��i;��G[m[���VնD�m_��?���k~��	�-T�V������v�`��36N�$�6���.h
44�V"�F��/�T�׊�ǈ�~�#5�փE��Җb�"�1F#�Bп������~Ο���
��� i���(�UB�P��i?�#A��\<�m�&S�����y�����Yƻt+���u��$����(�ßdb�5'2��%���\�����Z��*Lc �!� (L�%��(HjM�����2��s���>���ZxF%��VI�g��B�!���'�'�M�����4���s`F��ֲ��N˛�gL����ٗhy�z�����cnM�_��R�l��}�%�N����3�=��`;�k���I�Ai�=j^1���� ��b3��h���w{�G�i55��<T����rD���k2�Pp��vư�b�3���o�����u�?�ju۰���:���ʺ�PVylm�*#�c?����u��Nڬ6��~�?�r��ؘ��f�_w��N���yy+w;C�A�d��;�7������X     GDSCd     (�/�`M �D>0�*�x?���~o���-Z��m��b�0@�V��R��V�A;&��
o&W�m+)��K�N+ 5 . �z֖A[����xmMm�m�U��A�U�V�?�c�?�?(��c��A�H#����2=��k�߯�1m��E�j���߫#@�g���)s �<͉4A	@�dY�0�#�p�-����G�)~�?�~	���;4�
���N)�Ҷmv9)�Gz�12EP]G��ȍ�C�u�ͼ`��J�!�e�EZ�9�*�C}w� 9Je���]S�Re�qA�y�eZ�s�;L?�Gq(W�)��O����l�#�b�ٲ8��+m��N���n�h�hB�Z{G����ژlN����h�� I=��@�S�������"��."���L�����k�c�[����J0`��y~mC�H�j���qQ�1��������_N�J;�+�ܫ{s��>>�y��?��	t�����U��x�6��jQ�n�W90��?�Tcy��s��:2f/��O�m��w��i�]�j��|����ߣ}�旂���M�݃7����y��oGc�bn.��a��~��,,�ŉ3e4�dp����a��l��Y(��_����:9�K�s�M��$U GDSCd   �  (�/�`��1 ���I���0�E��g�eɘ����ɔ�l��#@n����zT�����Ǚ�؛�
Z�����{�2��v�l�#8R7��觕 � k S4�E�U��D������$R9kT�.O���uj��iIԓT���?C����c���J9���2MYRv�-Zv���v	���4dw�~�.���=F�[��]"^�ev���h���쮐�5�����]��%��Pv���B�.���s������B?-����Ԡ?w�v�!��Q�aw�'�`�7oC�� <+�G:
?&���{'��|H7-��q��r�����|eɂDӡ��h����|L"��C2�燲d=
���|9�N��t�����Aa[ϷCq�-����_o�<ڕ�We �:�?���c���X}�1���ӡ��tΤ�|���T��X�N�����W���)N~������#����'�����_�ߑ��i��?����P�������}~!~����y�_�O���[�u~	�_����+��ѿmҵ襎��R�AEZ-�83��5�:d����Gh6��J?@@��L&��~VX�@�d�b�0��"�{x|�X��;<���H�Ēif��
H�D�Qf��MZc�Q��"G���"F�IsVRua��Yo^���q�Е�iѬ^��K�l��֪�$S�ļ�)L�q���P�;R%�"KR���2T1�Q���
���#Q���'8���Dd��$���p��U��+iD�c��V�X�c�:X���%�a��;��v��p ��GVR��]?_1�3b��h��.���V�����:ńήO'9q���)��i�����9>Z��a:̇�om�B�#�X1Z�ڰ��7c��@o?$p"�g�w}���.U[6.����ވ�m�zA����4p6y�ca�7�Q`�g�G3R3f�]�!k����ri������b�#Y�F.�����2����F�6��a�t���|�%��nƑ�us����u��ǖO�3����t���q���7Y0�EK�kvo?1��1��hw��og����t@�O�F��qx��>]Nwe`�Γ���i��P�[��Z6A�b����9����N����t��[B�E%�]�G� ��>�ѕ_���.�׾�����c����8�t�9 ��q�;�PMؿ#���x��Zd@���]o�����1�1��J#���s2o�Ѧ��I�X����j�d��o�>FOa���{���Ev�Wx��{2���Ė�G2�����Q��~���*	�<����^���V�4ل�D�Pw�}��s4_��~I</�e��坧\�m�ky�ByЮ�r#��q���>�/���+8����8�y�������$���Ʈ��ט�۝-�Rv?�+��>�WVg<oBNnj��;ۘ�|~�Ku����y��E�̛ ����U�
��kl����
fB�~���,�ˎv�OO������-��1��=p�73T7ԓq���:��r'��yW u'2�#*��|���4���rۺ*v��}�z�����X����a&�����pp�qk����͗��G�2�V       GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�Hrm�n�Ts�#��� ��Ԁ������g��f�#I����2���w5 z���1��H�#Y���úW���9ȵm-k�|P�C	�<��m�Rܭ d�o���m$EJ�vw��ԶmO�f���23ØyIG��23s�����̐�-�?�#�om�VR����ĥၝ`!m<�  mcm@��Jb�M�t���6�$z��uS�70��`U$&�&g�]����xa{���c���~�*�~�
�� ��B���H��~�~�V�)�J�:̠Ʉ	rYlrs6E�M5�hB�C?Q��x0sT��IGK��پl9��]�Cڗ-�-����1ᇕ��HŦ�Mv�.�i�q�4N[���i������RRy�:[�q�q�Ti��B]x���M�kP�tY�&sڶt	u��݁z���Lф��P�PA���w���>�ʎ
0�ȹ�v�6���:������^�iL.cB؍1�I�w� ���c�Yy��Na�y�2+�9:���͏}����:�i���eX���s=S�ZL�<oJ��M�Z�JU�T�27�E��4����"k���&:�-��zK�ڭ:���Yn����EU�Tq�Sm�Jav"2Q܉�[ ��
}RP#����s,��}��g��lh�jcGJy��в�6�N�"�����+��Ģ�7n�a�j;|pW�f��E}�%�XA�N
�䑭���j��t���+���\��EH)�n��!:��^Pk�]�|��lT ��Z�4�729f�Ј)w��T0Ĕ�ix�\�b�9�<%�#Ɩs�Z�O�mjX �qZ0W����E�Y�ڨD!�$G�v����BJ�f|pq8��5�g�o��9�l�?���Q˝+U�	>�7�K��z�t����n�H�+��FbQ9���3g-UCv���-�n�*���E��A�҂
�Dʶ� ��WA�d�j��+�5�Ȓ���"���n�U��^�����$G��WX+\^�"�h.���M�3�e.
����MX�K,�Jfѕ*N�^�o2��:ՙ�#o�e.
��p�"<W22ENd�4B�V4x0=حZ�y����\^�J��dg��_4�oW�d�ĭ:Q��7c�ڡ��
A>��E�q�e-��2�=Ϲkh���*���jh�?4�QK��y@'�����zu;<-��|�����Y٠m|�+ۡII+^���L5j+�QK]����I �y��[�����(}�*>+���$��A3�EPg�K{��_;�v�K@���U��� gO��g��F� ���gW� �#J$��U~��-��u���������N�@���2@1��Vs���Ŷ`����Dd$R�":$ x��@�t���+D�}� \F�|��h��>�B�����B#�*6��  ��:���< ���=�P!���G@0��a��N�D�'hX�׀ "5#�l"j߸��n������w@ K�@A3�c s`\���J2�@#�_ 8�����I1�&��EN � 3T�����MEp9N�@�B���?ϓb�C��� � ��+�����N-s�M�  ��k���yA 7 �%@��&��c��� �4�{� � �����"(�ԗ�� �t�!"��TJN�2�O~� fB�R3?�������`��@�f!zD��%|��Z��ʈX��Ǐ�^�b��#5� }ى`�u�S6�F�"'U�JB/!5�>ԫ�������/��;	��O�!z����@�/�'�F�D"#��h�a �׆\-������ Xf  @ �q�`��鎊��M��T��(}�_�w�}���r�L|� |v�՘�e��yw�S|�� U�${1J'��[�ڞ�x��2����:��Ggjxؗ�m3�ivF��`�ߢe��a��G��V�t��is��J�����'�Q_5W���?�l�{1g���kԶ�zk�T�-|�V*��ޜZ�CW�,��(۝��Ǘ��� T{?�^��{���(9�(��u�5�͚����y~)J�&������}	@���74���&���N-�L_���o��������ݵ=�����y�VK��&�����������G�xߠ�]������ev%�{��eycc�{s�\�RАk{�|��P���eu�~]���2?0�F���1�V&x���:c������/�g{�.F)PDwGf�M�����(�0}��ag��e�'���6l�"s�L�H�c�"��̊ #Yf���:8������
�Eذ�3u�k5�Bt�m���!�#*Eǚa�ܰ_��Tq�.�0}�a@�^G��N�a��\��A�N�0���I���lq�5�+(��Џ�����Yq�wz_���*;<-w�;tX�"��n�'����Mۭy`0��kOԙ������,�����x�'��S�ݚa�텷�u��h����\��~�d.;����q5f-���������|�������ͪQl�9���~�\����7��^�?��������e�u$?`�߇u��*��yT����������A�6�E~`\�����n��1l�7t�;G�I��c��,VJ�Q[;�	Y|�kj��*�na����U�/�o��u�	?�闯7��׏w�m��.�|�~�}���r��RΎ��o.���o֜��~�_���.��ǿ�χ���q�˹���7�|�����~��[O5����2�%>�K�C�T׿�Y�L�%-	F�E�H,��v�t�f����i�V�N�'g��/)� ^.7��T��f��y�(����R��~f��p®��O���V�\���k���lڮ2aW��jc�{%�Y\m�šN�+����Y��׹H���y?��ۋG�~��b�l�9��dϻĸ��
��l�X��ɎZ�YDVD%*�P&��m�����]r�&��C����-2G-�-���d�gcgH��!�#�s^���s�l#/��l�r��#���8%Ӭ�L��1㬤ӖIYIa��0�qw���M�>�� � �����c��-$��D&����i�|L�n;�YˡR�����.�mK�P9_T� �c�����F*� ����+�\��|�Mt��nS�#��^+�l���2���|��9�Ç��9��X2mZPnߺ0P��������l�C�t'�^�A\�Q6�?Ɯ�_�EDVDDv�������vCcʁ&rw`w@�'c�%��6�_>0�m��i�}ܢ���            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://ci2d8jfrne35d"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                GDSCd   X  (�/�`X �42`M3K���8)��	��1``~�vY�5-�ݏ0��6�Zi�&�� , ! �h���m��OmG2�jچ�i��[��_��?�WY�q�Ɛe��p6~�I:��}l:&�JB��h{�K��"F1�b���[��_��_@�����+�i]�?�O �Yל�H��Ȫ��w�&雕w�$>�I^X	����{T<aEnb�����
S�g3 ��	�*MI)�f(I�ff�v6�T�n52�0>��i7�@P�e9�Q���@����ѵ��݃)�%ސ1Ձ޶93���7��{O2zO7�"��FN=���Q�p	�R/RM�Nʸ�S<z���b}H�6���ɱ�3~�ޟ6�����Ӎ�U���[,J��u��!��_<���w���6������^v�C�;���y���E��e�����-���3{��U        [remap]

path="res://.godot/exported/133200997/export-05d8d9c8af05f861af50c6d4c1f4eea7-bullet.scn"
             [remap]

path="res://.godot/exported/133200997/export-d480ec2241b801fab7ff87b6104cc1b0-main_character.scn"
     [remap]

path="res://.godot/exported/133200997/export-982e7c4e07d08eb16dee27c6fe9e45d5-mob.scn"
[remap]

path="res://.godot/exported/133200997/export-2ddd04d543d5858e7f20c9299a8b5096-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-53a0af8f00fbc899d4d541c34a803049-menu.scn"
               [remap]

path="res://Scripts/bullet.gdc"
       [remap]

path="res://Scripts/character.gdc"
    [remap]

path="res://Scripts/game_manager.gdc"
 [remap]

path="res://Scripts/mob.gdc"
          [remap]

path="res://Scripts/mob_spawner.gdc"
  [remap]

path="res://menu.gdc"
 list=Array[Dictionary]([{
"base": &"CharacterBody2D",
"class": &"Mob",
"icon": "",
"language": &"GDScript",
"path": "res://Scripts/mob.gd"
}, {
"base": &"Node2D",
"class": &"MobSpawner",
"icon": "",
"language": &"GDScript",
"path": "res://Scripts/mob_spawner.gd"
}])
     <svg xmlns="http://www.w3.org/2000/svg" width="128" height="128"><rect width="124" height="124" x="2" y="2" fill="#363d52" stroke="#212532" stroke-width="4" rx="14"/><g fill="#fff" transform="translate(12.322 12.322)scale(.101)"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 814 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H446l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c0 34 58 34 58 0v-86c0-34-58-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042" transform="translate(12.322 12.322)scale(.101)"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></svg>                 ���~���k   res://Prefabs/bullet.tscn30�F1w� !   res://Prefabs/main_character.tscn���UP"_T   res://Prefabs/mob.tscnu?��zС
   res://Scenes/main.tscn�R#�j00f   res://Scenes/menu.tscn?�=�HN�J   res://icon.svg          res://addons/godot-git-plugin/git_plugin.gdextension
           ECFG      application/config/name         2DGame     application/run/main_scene          res://Scenes/menu.tscn     application/config/features$   "         4.3    Forward Plus       application/config/icon         res://icon.svg     editor/movie_writer/movie_file<      3   C:/Users/Vexell/Documents/2dgame/Clips/showcase.avi "   editor/version_control/plugin_name      	   GitPlugin   *   editor/version_control/autoload_on_startup            global_group/mobs                        