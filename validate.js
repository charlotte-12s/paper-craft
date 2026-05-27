const fs = require('fs');
const path = require('path');

const skills = {
  'paper-launch': [],
  'paper-search': ['search-sources', 'query-construction', 'quality-filter', 'relevance-scoring', 'citation-traversal'],
  'paper-idea': ['innovation-methods'],
  'paper-plan': ['training-recipes', 'env-compat'],
  'paper-data': ['data-pipeline', 'contamination-check'],
  'paper-env': ['env-compat'],
  'paper-train': ['training-recipes', 'results-analysis'],
  'paper-story': ['story-patterns'],
  'paper-write': ['abstract', 'introduction', 'related-work', 'method', 'experiments', 'conclusion', 'revision', 'figures-and-tables'],
  'paper-review': ['review-rubric'],
  'paper-rebuttal': ['rebuttal-strategies'],
  'paper-audit': ['audit-checklist']
};

const conferences = ['icml', 'iclr', 'neurips', 'aaai', 'ijcai', 'cvpr', 'iccv', 'eccv', 'acl', 'emnlp', 'kdd', 'sigir', 'www', 'wsdm', 'icse', 'sp'];

let ok = true;

// Check each skill's SKILL.md and reference files
Object.entries(skills).forEach(([skill, refs]) => {
  const skillPath = 'skills/' + skill + '/SKILL.md';
  if (!fs.existsSync(skillPath)) {
    console.error('MISSING: ' + skillPath);
    ok = false;
  } else {
    const content = fs.readFileSync(skillPath, 'utf8');
    if (!content.includes('name:') || !content.includes('description:')) {
      console.error('INVALID FRONTMATTER: ' + skillPath);
      ok = false;
    }
  }

  refs.forEach(ref => {
    const refPath = 'skills/' + skill + '/references/' + ref + '.md';
    if (!fs.existsSync(refPath)) {
      console.error('MISSING: ' + refPath);
      ok = false;
    }
  });
});

// Check conference profiles
conferences.forEach(conf => {
  const confPath = 'references/conferences/' + conf + '.md';
  if (!fs.existsSync(confPath)) {
    console.error('MISSING: ' + confPath);
    ok = false;
  } else {
    const content = fs.readFileSync(confPath, 'utf8');
    const required = ['Basic Info', 'Review Weights', 'Writing Style', 'Anti-patterns', 'Success Patterns'];
    required.forEach(section => {
      if (!content.includes(section)) {
        console.error('MISSING SECTION "' + section + '" in ' + confPath);
        ok = false;
      }
    });
  }
});

// Check root files
['CLAUDE.md', 'install.sh'].forEach(f => {
  if (!fs.existsSync(f)) {
    console.error('MISSING: ' + f);
    ok = false;
  }
});

if (ok) {
  console.log('All files valid');
} else {
  process.exit(1);
}
