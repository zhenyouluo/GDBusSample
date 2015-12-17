all:
	gcc -o server_side_application_using_generated_code generated-code.c server_side_application_using_generated_code.c `pkg-config --cflags --libs  gio-unix-2.0`
	gcc -o client_side_application_using_generated_code generated-code.c client_side_application_using_generated_code.c `pkg-config --cflags --libs  gio-unix-2.0`

gen:
	gdbus-codegen --interface-prefix org.gtk.GDBus.Example.ObjectManager. --generate-c-code generated-code --c-namespace Example --c-generate-object-manager --generate-docbook generated-docs gdbus-example-objectmanager.xml

clean:
	rm -rf server_side_application_using_generated_code client_side_application_using_generated_code
	rm -rf generated-code.c generated-code.h
	rm -rf generated-docs-org.gtk.GDBus.Example.ObjectManager.Animal.xml
	rm -rf generated-docs-org.gtk.GDBus.Example.ObjectManager.Cat.xml