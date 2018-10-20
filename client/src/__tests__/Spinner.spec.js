import Spinner from '../components/Spinner';

describe('<Spinner />', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<Spinner />);
  });

  it('renders without crashing', () => {
    expect(wrapper).toHaveLength(1);
  });
});
