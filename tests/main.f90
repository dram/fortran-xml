program main
  use iso_c_binding

  implicit none

  block
    use xml

    integer(c_int)                    :: size
    character(:, c_char), allocatable :: data
    character(kind=c_char), pointer   :: fptr (:)
    type(c_ptr)                       :: doc, node, cptr, root

    doc = xml_new_doc("1.0" // c_null_char)

    root = xml_new_node(c_null_ptr, "root" // c_null_char)
    node = xml_new_child( &
         root, c_null_ptr, "node" // c_null_char, "contents" // c_null_char)
    node = xml_set_root_element(doc, root)

    call xml_doc_dump_memory(doc, cptr, size)
    call xml_free_doc(doc)
    call c_f_pointer(cptr, fptr, [size])
    allocate(character(size, c_char) :: data)
    data = transfer(fptr, data)
    call xml_free(cptr)

    print *, data

    deallocate(data)
  end block
end program main
