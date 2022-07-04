var stakingMockData = {
  'termination': {
    'id': 1,
    'status': 'TERMINATION',
    'startAt': "2022-06-22T15:00:00.000Z",
    'endAt': "2022-06-22T15:00:00.000Z",
    'rate': 15,
    'rewardRate': 20,
    'objectiveToken': '100.0',
    'token': '75.3',
    'round': 10,
  },
  'inProgress': {
    'id': 2,
    'status': 'INPROGRESS',
    'startAt': "2022-06-22T15:00:00.000Z",
    'endAt': "2022-07-25T15:00:00.000Z",
    'rate': 15,
    'rewardRate': 20,
    'objectiveToken': '100.0',
    'token': '75.3',
    'round': 10,
  },
  'preparation': {
    'id': 3,
    'status': 'PREPARATION',
    'startAt': "2022-06-22T15:00:00.000Z",
    'endAt': "2022-06-22T15:00:00.000Z",
    'rate': 15,
    'rewardRate': 20,
    'objectiveToken': '100.0',
    'token': '75.3',
    'round': 10,
  }
};

class StakingService {
  Map<String, Map<String, Object>> getStakingData() {
    return stakingMockData;
  }
}
