module xml
  implicit none

  interface
     !! entities
     !! ********
     function xml_encode_entities_reentrant(doc, input) &
          bind(c, name="xmlEncodeEntitiesReentrant")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: doc, input
       type(c_ptr) xml_encode_entities_reentrant
     end function xml_encode_entities_reentrant

     !! tree
     !! ****
     subroutine xml_doc_dump_memory(doc, memory, size) &
          bind(c, name="xmlDocDumpMemory")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: doc
       type(c_ptr), intent(out) :: memory
       integer(c_int), intent(out) :: size
     end subroutine xml_doc_dump_memory

     function xml_save_file(filename, doc) &
          bind(c, name="xmlSaveFile")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: filename, doc
       integer(c_int) xml_save_file
     end function xml_save_file

     function xml_save_file_enc(filename, doc, encoding) &
          bind(c, name="xmlSaveFileEnc")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: filename, doc, encoding
       integer(c_int) xml_save_file_enc
     end function xml_save_file_enc

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

     function xml_new_doc(version) &
          bind(c, name="xmlNewDoc")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: version
       type(c_ptr) xml_new_doc
     end function xml_new_doc

     function xml_new_node(namespace, name) &
          bind(c, name="xmlNewNode")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: namespace, name
       type(c_ptr) xml_new_node
     end function xml_new_node

     function xml_new_child(parent, namespace, name, content) &
          bind(c, name="xmlNewChild")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: parent, namespace, name, content
       type(c_ptr) xml_new_child
     end function xml_new_child

     function xml_parse_memory(buffer, size) &
          bind(c, name="xmlParseMemory")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: buffer
       integer(c_int), value :: size
       type(c_ptr) xml_parse_memory
     end function xml_parse_memory

     function xml_set_root_element(doc, root) &
          bind(c, name="xmlDocSetRootElement")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: doc, root
       type(c_ptr) xml_set_root_element
     end function xml_set_root_element
  end interface
end module xml
