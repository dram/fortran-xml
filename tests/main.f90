program main
  use iso_c_binding

  implicit none

  block
    use xml

    character(:), allocatable, target :: contents, data, tag, version
    type(c_ptr) doc, node, cptr, root
    character, pointer :: fptr (:)
    integer size

    allocate (contents, source = "contents" // c_null_char)

    version = "1.0" // c_null_char
    doc = xml_new_doc(c_loc(version))

    tag = "root" // c_null_char
    root = xml_new_node(c_null_ptr, c_loc(tag))
    tag = "node" // c_null_char
    node = xml_new_child(root, c_null_ptr, c_loc(tag), c_loc(contents))
    node = xml_doc_set_root_element(doc, root)

    call xml_doc_dump_memory(doc, cptr, size)
    call xml_free_doc(doc)
    call c_f_pointer(cptr, fptr, [size])
    allocate(character(size, c_char) :: data)
    data = transfer(fptr, data)
    call xml_free(cptr)

    print *, data
  end block
end program main
