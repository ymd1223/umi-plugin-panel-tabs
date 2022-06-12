import React, { useContext, useRef } from 'react';
import type { FC } from 'react';
// @ts-ignore
import { useAliveController } from 'react-activation';
import PanelTab from './PanelTab';
import { CaretLeftOutlined, CaretRightOutlined } from '@ant-design/icons';
import { Space } from 'antd';
import { RouteContext } from '@ant-design/pro-layout';

const PanelTabs: FC = () => {
  const { getCachingNodes } = useAliveController();
  const cachingNodes = getCachingNodes();
  const routeContext = useContext(RouteContext);
  const scrollContainer = useRef<HTMLDivElement>();

  return (
    <div
      style={{
        position: 'fixed',
        zIndex: 9,
        width: '100%',
        height: '46px',
        line-height: '46px',
        padding: '0px 30px 0px 20px',
        backgroundColor: '{{{tabsBarBackgroundColor}}}',
        // borderTop: '1px solid rgb(216, 220, 229)',
        borderBottom: '1px solid rgb(216, 220, 229)',
        boxShadow: '0 1px 3px 0 rgb(0 0 0 / 12%), 0 0 3px 0 rgb(0 0 0 / 4%)',
        margin-top: -20px;
      }}
    >
      
      <div className="panel-tabs-bar" ref={scrollContainer}>
        {cachingNodes.map((node, idx) => (
          <PanelTab key={idx} node={node} />
        ))}
        <Space
          style={{
            backgroundColor: '{{{tabsBarBackgroundColor}}}',
            position: 'fixed',
            right: 0,
            paddingRight: '5px',
            textAlign: 'center',
            lineHeight: '44px',
            fontSize: '18px',
          }}
        >
          <CaretLeftOutlined
            style={{ display: 'inline-block', cursor: 'pointer' }}
            onClick={() =>
              (scrollContainer.current.scrollLeft = scrollContainer.current.scrollLeft - 100)
            }
          />
          <CaretRightOutlined
            style={{ display: 'inline-block', cursor: 'pointer' }}
            onClick={() =>
              (scrollContainer.current.scrollLeft = scrollContainer.current.scrollLeft + 100)
            }
          />
        </Space>
      </div>
    </div>
  );
};

export default PanelTabs;
