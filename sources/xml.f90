module xml
  use iso_c_binding
  implicit none

  interface
     subroutine xml_doc_dump_memory(doc, memory, size) &
          bind(c, name="xmlDocDumpMemory")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: doc
       type(c_ptr), intent(out) :: memory
       integer(c_int), intent(out) :: size
     end subroutine xml_doc_dump_memory

     ! FIXME:
     !   should bind to `xmlFree` (a function pointer), maybe:
     !     type(c_funptr), bind(c, name="xmlFree") :: xml_free_c_funptr
     !     c_f_procpointer(xml_free_c_funptr, xml_free)
     subroutine xml_free(memory) &
          bind(c, name="free")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: memory
     end subroutine xml_free

     subroutine xml_free_doc(doc) &
          bind(c, name="xmlFreeDoc")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: doc
     end subroutine xml_free_doc

     function xml_new_doc(version) result(doc) &
          bind(c, name="xmlNewDoc")
       use iso_c_binding, only: c_char, c_ptr
       character(kind=c_char), intent(in) :: version (*)
       type(c_ptr) :: doc
     end function xml_new_doc

     function xml_new_node(namespace, name) result(node) &
          bind(c, name="xmlNewNode")
       use iso_c_binding, only: c_char, c_ptr
       type(c_ptr), value :: namespace
       character(kind=c_char), intent(in) :: name (*)
       type(c_ptr) :: node
     end function xml_new_node

     function xml_new_child(parent, namespace, name, content) result(node) &
          bind(c, name="xmlNewChild")
       use iso_c_binding, only: c_char, c_ptr
       type(c_ptr), value :: parent, namespace
       character(kind=c_char), intent(in) :: name (*), content (*)
       type(c_ptr) :: node
     end function xml_new_child

     function xml_save_file(filename, doc) result(bytes) &
          bind(c, name="xmlSaveFile")
       use iso_c_binding, only: c_char, c_int, c_ptr
       character(kind=c_char), intent(in) :: filename (*)
       type(c_ptr), value :: doc
       integer(c_int) :: bytes
     end function xml_save_file

     function xml_set_root_element(doc, root) result(old) &
          bind(c, name="xmlDocSetRootElement")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: doc, root
       type(c_ptr) :: old
     end function xml_set_root_element
  end interface
end module xml
