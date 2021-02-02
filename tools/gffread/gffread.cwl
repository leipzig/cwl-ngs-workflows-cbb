#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: GFFread
doc: gffread can be used to validate, filter, convert and perform various other operations on GFF files

requirements:
  InlineJavascriptRequirement: {}

hints:
  DockerRequirement:
    dockerPull: truwl/gffread_0.9.9_0.1.0
  SoftwareRequirement:
    packages:
      clustalo:
        specs: [ "https://bio.tools/gffread" ]
        version: [ "0.9.9" ]

inputs:
  input:
    type: File
    inputBinding:
      position: 1
  T:
    type: boolean?
    inputBinding:
      position: 2
      prefix: -T
  o:
    type: string
    inputBinding:
      position: 3
      prefix: -o



outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.o)

baseCommand: ["gffread"]

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-4108-5982
    s:email: mailto:r78v10a07@gmail.com
    s:name: Roberto Vera Alvarez

s:codeRepository: http://ccb.jhu.edu/software/stringtie/gff.shtml
s:license: https://spdx.org/licenses/OPL-1.0

$namespaces:
  s: http://schema.org/

$schemas:
  - https://schema.org/version/latest/schema.rdf
