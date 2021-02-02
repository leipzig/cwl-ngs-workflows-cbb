#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: ChromHMM-BinarizeBed
doc: Chromatin state discovery and characterization

requirements:
  InlineJavascriptRequirement: {}

hints:
  DockerRequirement:
    dockerPull: truwl/chromhmm_1.21_0.1.0
  SoftwareRequirement:
    packages:
      chromhmm:
        specs: [ "https://bio.tools/chromhmm" ]
        version: [ "1.21" ]


inputs:
  paired:
    type: boolean?
    inputBinding:
      position: 1
      prefix: -paired
    doc: |
      If this option is present then reads in the BAM file are treated as pairs
  chromsize:
    type: File
    inputBinding:
      position: 2
    doc: |
      ChromHMM genome size
  input:
    type: Directory
    inputBinding:
      position: 3
    doc: |
      Input directory
  cellmarkfiletable:
    type: File
    inputBinding:
      position: 4
    doc: |
      cellmarkfiletable file
  output_dir:
    type: string
    inputBinding:
      position: 5

outputs:
  output:
    type: Directory
    outputBinding:
      glob: $(inputs.output_dir)

baseCommand: [ChromHMM.sh, BinarizeBed]

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-4108-5982
    s:email: mailto:r78v10a07@gmail.com
    s:name: Roberto Vera Alvarez

s:codeRepository: http://compbio.mit.edu/ChromHMM/
s:license: https://spdx.org/licenses/OPL-1.0

$namespaces:
  s: http://schema.org/

$schemas:
  - https://schema.org/version/latest/schema.rdf
