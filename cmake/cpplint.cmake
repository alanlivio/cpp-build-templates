# disable unwanted filters
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/braces,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/semicolon,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/blank_line,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/comma,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/operators,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/parens,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/indent,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/comments,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/newline,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/tab,)
set(STYLE_FILTER ${STYLE_FILTER}-build/include_order,)
set(STYLE_FILTER ${STYLE_FILTER}-build/namespaces,)
set(STYLE_FILTER ${STYLE_FILTER}-build/include_what_you_use,)
set(STYLE_FILTER ${STYLE_FILTER}-readability/streams,)
set(STYLE_FILTER ${STYLE_FILTER}-readability/todo,)
set(STYLE_FILTER ${STYLE_FILTER}-runtime/references,)
set(STYLE_FILTER ${STYLE_FILTER}-runtime/int,)
set(STYLE_FILTER ${STYLE_FILTER}-runtime/explicit,)
set(STYLE_FILTER ${STYLE_FILTER}-runtime/printf,)
set(STYLE_FILTER ${STYLE_FILTER}-legal/copyright,)

find_package(PythonInterp)

add_custom_target(cpplint)
macro(add_cpplint_target ${SOURCES_DIRS})
  message(STATUS "Folders to run cpplint: ${ARGN}")
  foreach(DIR ${ARGN})
    file(GLOB_RECURSE DIR_FILES
        RELATIVE ${CMAKE_SOURCE_DIR}
        ${DIR}/*.c ${DIR}/*.cc ${DIR}/*cpp ${DIR}/*.h ${DIR}/*hpp)
    add_custom_target(cpplint_${DIR}
        COMMENT "Running cpplint in ${DIR} folder."
        VERBATIM
        COMMAND "${CMAKE_COMMAND}" -E chdir
                "${CMAKE_CURRENT_SOURCE_DIR}"
                "${PYTHON_EXECUTABLE}"
                "${CMAKE_SOURCE_DIR}/scripts/cpplint.py"
                "--root=${DIR}"
                "--filter=${STYLE_FILTER}"
                "--counting=detailed"
                "--extensions=c,cc,cpp,h,hpp"
                "--linelength=250"
                ${DIR_FILES})
    add_dependencies(cpplint cpplint_${DIR})
  endforeach()
endmacro()

