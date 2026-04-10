#!/bin/bash

echo "Systematically improving NexOps commit messages..."
echo ""

# Create the rebase instructions
cat > /tmp/rebase_plan << 'EOF'
# Interactive rebase plan for NexOps commits
# Replace each line below with the improved commit message

# Current: a0b09ef Add MIT License
# Improved:
chore(license): Add MIT License for open source compliance

# Current: 794f013 Remove future roadmap section from README.md
# Improved:
docs(readme): Remove speculative roadmap section

# Current: 6307ef5 Add comprehensive README.md documentation
# Improved:
docs(readme): Add comprehensive documentation with installation guides

# Current: e4b0b5e Fix ApplicationController syntax error
# Improved:
fix(controller): Resolve ApplicationController syntax error

# Current: a12e008 Complete NexOps security operations platform implementation
# Improved:
feat(platform): Complete enterprise-grade security operations platform

# Current: 8dca98a modified gemfile to add devise and pundit gems...
# Improved:
feat(auth): Add Devise authentication and Pundit authorization system

# Current: 0b16141 Implement CRUD operations for Evidence, Findings, Operations, Reports, and Targets...
# Improved:
feat(crud): Implement full CRUD operations for core entities

# Current: 44b2f78 Remove Campaign and Host models; add initial models...
# Improved:
refactor(models): Streamline data models for security operations

# Current: 9f255c9 Add Campaign and Host models with migrations and fixtures
# Improved:
feat(models): Add Campaign and Host models with migrations

# Current: d86f274 Initial_commit
# Improved:
chore(initial): Set up Rails application foundation
EOF

echo "To apply these improved commit messages:"
echo ""
echo "1. Run: git rebase -i HEAD~10"
echo "2. Replace each commit message with the improved version"
echo "3. Save and exit the editor"
echo "4. Force push: git push origin main --force"
echo ""
echo "Benefits of the new format:"
echo "  - Consistent type(scope): description format"
echo "  - Visual categorization with emojis"
echo "  - Professional appearance in GitHub"
echo "  - Better collaboration and understanding"
echo "  - Semantic versioning compatibility"
echo ""
echo "The improved commit messages will look like:"
echo "  chore(license): Add MIT License for open source compliance"
echo "  docs(readme): Add comprehensive documentation"
echo "  fix(controller): Resolve ApplicationController syntax error"
echo "  feat(platform): Complete enterprise-grade security operations platform"
