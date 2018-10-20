import { Row } from '../components/Grid';

describe('<Row />', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<Row />);
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
    expect(wrapper.find('.Row').hasClass('my-class')).toBeTruthy();
  });

  describe('when given a prop', () => {
    it('renders inline class', () => {
      wrapper.setProps({ inline: true });
      expect(wrapper.hasClass('Row--inline')).toBeTruthy();
    });

    it('renders no-wrap class', () => {
      wrapper.setProps({ wrap: 'no-wrap' });
      expect(wrapper.hasClass('Row--no-wrap')).toBeTruthy();
    });

    it('renders wrap-reverse class', () => {
      wrapper.setProps({ wrap: 'wrap-reverse' });
      expect(wrapper.hasClass('Row--wrap-reverse')).toBeTruthy();
    });

    it('renders column class', () => {
      wrapper.setProps({ column: true });
      expect(wrapper.hasClass('Row--column')).toBeTruthy();
    });

    it('renders align-start class', () => {
      wrapper.setProps({ align: 'start' });
      expect(wrapper.hasClass('Row--align-start')).toBeTruthy();
    });

    it('renders align-center class', () => {
      wrapper.setProps({ align: 'center' });
      expect(wrapper.hasClass('Row--align-center')).toBeTruthy();
    });

    it('renders align-end class', () => {
      wrapper.setProps({ align: 'end' });
      expect(wrapper.hasClass('Row--align-end')).toBeTruthy();
    });

    it('renders align-baseline class', () => {
      wrapper.setProps({ align: 'baseline' });
      expect(wrapper.hasClass('Row--align-baseline')).toBeTruthy();
    });

    it('renders align-stretch class', () => {
      wrapper.setProps({ align: 'stretch' });
      expect(wrapper.hasClass('Row--align-stretch')).toBeTruthy();
    });

    it('renders justify-start class', () => {
      wrapper.setProps({ justify: 'start' });
      expect(wrapper.hasClass('Row--justify-start')).toBeTruthy();
    });

    it('renders justify-center class', () => {
      wrapper.setProps({ justify: 'center' });
      expect(wrapper.hasClass('Row--justify-center')).toBeTruthy();
    });

    it('renders justify-end class', () => {
      wrapper.setProps({ justify: 'end' });
      expect(wrapper.hasClass('Row--justify-end')).toBeTruthy();
    });

    it('renders justify-between class', () => {
      wrapper.setProps({ justify: 'between' });
      expect(wrapper.hasClass('Row--justify-between')).toBeTruthy();
    });

    it('renders justify-around class', () => {
      wrapper.setProps({ justify: 'around' });
      expect(wrapper.hasClass('Row--justify-around')).toBeTruthy();
    });

    it('renders row-reverse class', () => {
      wrapper.setProps({ reverse: true });
      expect(wrapper.hasClass('Row--row-reverse'));
    });

    it('renders column-reverse class', () => {
      wrapper.setProps({ column: true, reverse: true });
      expect(wrapper.hasClass('Row--row-reverse'));
    });
  });
});
