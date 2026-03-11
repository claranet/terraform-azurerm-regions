# Claude AI Assistant Guidelines for OpenTofu Module Development

This document provides specific guidelines for Claude AI assistant when working on OpenTofu modules, ensuring optimal code generation and module optimization.

## Prerequisites

**IMPORTANT**: Before proceeding, Claude must first read and follow the shared implementation guidelines in [`AGENTS.md`](AGENTS.md). This document contains the detailed technical specifications that apply to all AI agents working on OpenTofu modules.

## Claude-Specific Instructions

When working with OpenTofu modules, Claude should:

1. **Read [`AGENTS.md`](AGENTS.md) first** - All technical implementation details are documented there
2. **Apply the shared guidelines** systematically following the 8-step process outlined in AGENTS.md
3. **Follow the Claude-specific behavioral guidelines** outlined below

## Claude Behavioral Guidelines

### Code Generation Approach
- **Context Awareness**: Always consider the module's context and existing patterns before making changes
- **Incremental Updates**: Apply changes systematically, one section at a time
- **Validation First**: Validate existing code structure before proposing modifications
- **Pattern Recognition**: Identify and maintain consistent patterns across similar modules

### Communication Style
- **Clear Explanations**: Provide clear, technical explanations for all changes
- **Step-by-Step Process**: Break down complex transformations into logical steps
- **Before/After Examples**: Show concrete examples of transformations when helpful
- **Rationale**: Explain the reasoning behind each change in terms of best practices

### Quality Assurance Approach
- **Systematic Verification**: Follow the quality checklist methodically
- **Cross-Reference Validation**: Ensure changes align with [`AGENTS.md`](AGENTS.md) specifications
- **Retrocompatibility Focus**: Always prioritize backward compatibility
- **Documentation Consistency**: Maintain consistency across all documentation files

### Error Prevention
- **Syntax Validation**: Verify all generated Terraform/OpenTofu syntax is correct
- **Reference Integrity**: Ensure all file references and links are valid
- **Version Compatibility**: Check that all version constraints are properly set
- **Example Functionality**: Validate that all code examples are functional

## Claude Implementation Workflow

1. **Assessment Phase**
   - Read and understand [`AGENTS.md`](AGENTS.md) specifications
   - Analyze current module structure and identify areas for improvement
   - Plan the transformation sequence to minimize disruption

2. **Implementation Phase**
   - Apply changes following the 8-step process from [`AGENTS.md`](AGENTS.md)
   - Generate `moved` blocks for any resource renames
   - Update all related documentation and examples

3. **Validation Phase**
   - Run through the quality checklist
   - Verify all examples and configurations
   - Ensure retrocompatibility is maintained

## Quality Checklist for Claude

Before completing any OpenTofu module work, verify:

### Technical Implementation
- [ ] [`AGENTS.md`](AGENTS.md) guidelines have been read and understood
- [ ] All 8 implementation steps from [`AGENTS.md`](AGENTS.md) have been applied
- [ ] All outputs follow the new naming convention
- [ ] Main resource is renamed to "main" with appropriate `moved` block
- [ ] Variable descriptions are properly punctuated and formatted
- [ ] File naming conventions are followed
- [ ] README documentation is updated with version tables and warnings
- [ ] `count` and `for_each` usage follows best practices
- [ ] Version constraints are properly set
- [ ] All examples are validated and functional
- [ ] Retrocompatibility is maintained
- [ ] All file references and links are valid
- [ ] Documentation consistency is maintained across all files

### Git Contribution Compliance
- [ ] New branch created with appropriate prefix (`feat/`, `fix/`, `docs/`, `refactor/`, `chore/`)
- [ ] Tools installed and updated with `mise install`
- [ ] Pre-commit hooks installed and configured
- [ ] All commits follow conventional commits structure
- [ ] Pre-commit checks pass on all commits
- [ ] Merge request ready for review with clear description

## Notes for Claude

- **Principle of Least Surprise**: Follow established patterns and conventions
- **Clarity Over Cleverness**: Prioritize readable, maintainable code over complex optimizations
- **Consistency is Key**: Maintain uniform approaches across all modules and files
- **Always Reference Source**: When in doubt, refer back to [`AGENTS.md`](AGENTS.md) for authoritative guidance
