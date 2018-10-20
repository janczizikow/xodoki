import { Col } from '../components/Grid';

describe('<Col />', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<Col />);
  });

  it('renders without crashing', () => {
    expect(wrapper).toHaveLength(1);
  });

  it('renders children', () => {
    wrapper.setProps({ children: 'child' });
    expect(wrapper.text()).toBe('child');
  });

  it('renders custom Tag', () => {
    wrapper.setProps({ tag: 'section' });
    expect(wrapper.type()).toBe('section');
  });

  it('renders additional classNames', () => {
    wrapper.setProps({ className: 'my-class' });
    expect(wrapper.hasClass('my-class')).toBeTruthy();
  });

  it('renders xs class when given a prop', () => {
    wrapper.setProps({ xs: 12 });
    expect(wrapper.hasClass('Col--xs-12')).toBeTruthy();
  });

  it('renders sm class when given a prop', () => {
    wrapper.setProps({ sm: 6 });
    expect(wrapper.hasClass('Col--sm-6')).toBeTruthy();
  });

  it('renders md class when given a prop', () => {
    wrapper.setProps({ md: 4 });
    expect(wrapper.hasClass('Col--md-4')).toBeTruthy();
  });

  it('renders lg class when given a prop', () => {
    wrapper.setProps({ lg: 3 });
    expect(wrapper.hasClass('Col--lg-3')).toBeTruthy();
  });

  it('renders lg class when given a prop', () => {
    wrapper.setProps({ lg: 2 });
    expect(wrapper.hasClass('Col--lg-2')).toBeTruthy();
  });
});
